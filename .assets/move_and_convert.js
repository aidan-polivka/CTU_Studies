const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const rootDir = path.join(__dirname, '..');
// Function to delete a file or directory
const deleteFileOrDirectory = (filePath) => {
    if (fs.existsSync(filePath)) {
        fs.lstatSync(filePath).isDirectory()
            ? fs.rmdirSync(filePath, { recursive: true })
            : fs.unlinkSync(filePath);
        console.log(`Deleted: ${filePath}`);
    }
};

// Function to copy a file
const copyFile = (src, dest) => {
    if (src.endsWith(".docx")) {
        convertDocxToMarkdown(src, dest)
    } else {
        fs.mkdirSync(path.dirname(dest), { recursive: true });
        fs.copyFileSync(src, dest);
        console.log(`Copied: ${src} to ${dest}`);
    }
};

// Function to convert .docx to markdown using Pandoc
const convertDocxToMarkdown = (src, dest) => {
    const destMd = dest.replace('.docx', '.md');
    
    try {
        execSync(`pandoc --extract-media "${rootDir}" "${src}" -o "${destMd}"`, { stdio: 'inherit' });
        console.log(`Converted: ${src} to ${destMd}`);
    } catch (error) {
        console.error(`Error converting ${src} to ${destMd}: ${error.message}`);
    }
};

const excludedDirectories = [
    ".git",
    ".assets",
    "src",
    "README.md"
];

const processDir = (relativePath) => {
    const fullSrcDir = path.join(rootDir, 'src', relativePath);
    const fullDestDir = path.join(rootDir, relativePath);

    const srcContents = fs.existsSync(fullSrcDir) ? fs.readdirSync(fullSrcDir) : [];
    const destContents = (fs.existsSync(fullDestDir) ? fs.readdirSync(fullDestDir) : [])
        .filter(item => !item.endsWith('.md'));

    // process files
    const unionFiles = [...new Set([...srcContents, ...destContents])]
        .filter(item => !excludedDirectories.includes(item));

    unionFiles.forEach(item => {
        const srcItem = path.join(fullSrcDir, item);
        const destItem = item.endsWith('.docx') 
            ? path.join(fullDestDir, item.replace('.docx', '.md'))
            : path.join(fullDestDir, item);

        const srcStats = fs.existsSync(srcItem) ? fs.statSync(srcItem) : undefined;
        const destStats = fs.existsSync(destItem) ? fs.statSync(destItem) : undefined;

        if(srcStats?.isDirectory()) {
            // Ensure directory is created in destination
            fs.mkdirSync(destItem, { recursive: true });

            // Recursively process next directory
            processDir(path.join(relativePath, item));
        } else if(srcStats?.isFile()) {

            // Copy file if src is newer than destination or destination doesn't exist
            if(!destStats || destStats?.mtime < srcStats?.mtime) {
                copyFile(srcItem, destItem);
            }
        }

        // Delete dest folder if src version doesn't exist.
        if(!srcStats && destStats) {
            deleteFileOrDirectory(destItem);
        }
    })
}

processDir('');
execSync(`git add ${rootDir}`);
