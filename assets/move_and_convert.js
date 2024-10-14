const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

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
        execSync(`pandoc "${src}" -o "${destMd}"`, { stdio: 'inherit' });
        console.log(`Converted: ${src} to ${destMd}`);
    } catch (error) {
        console.error(`Error converting ${src} to ${destMd}: ${error.message}`);
    }
};

const excludedDirectories = [
    ".git",
    "assets"
];

const processDir = (relativePath) => {
    const srcDir = path.join('src', relativePath);
    const fullSrcDir = path.join(__dirname, srcDir);

    const destDir = relativePath;
    const fulldestDir = path.join(__dirname, relativePath);

    const srcContents = fs.existsSync(srcDir) ? fs.readdirSync(srcDir) : [];
    const destContents = fs.existsSync(destDir) ? fs.readdirSync(destDir) : [];

    // process files
    const unionFiles = [...new Set([...srcContents, ...destContents])]
        .filter(item => !excludedDirectories.includes(item));

    unionFiles.forEach(item => {
        const srcItem = path.join(fullSrcDir, item);
        const destItem = path.join(fulldestDir, item);

        const srcExists = fs.existsSync(srcItem);
        const destExists = fs.existsSync(destItem);

        if(srcExists && fs.statSync(srcItem).isDirectory()) {
            // Ensure directory is created in destination
            fs.mkdirSync(destItem, { recursive: true });

            // Recursively process next directory
            processDir(path.join(relativePath, item));
        } else if(srcExists && fs.statSync(srcItem).isFile()) {

            // Copy file if src is newer than destination or destination doesn't exist
            if(!destExists || fs.statSync(srcItem).mtime > fs.statSync(destItem).mtime) {
                copyFile(srcItem, destItem);
            }
        }

        // Delete dest folder if src version doesn't exist.
        if(!srcExists && destExists) {
            deleteFileOrDirectory(destItem);
        }
    })
}

processDir('');
