#include <fstream>
#include <isostream>
#include <string>

void LoadData(string topFolder){
  if(isdir(topFolder)){
    //checking depth of directories
    curDir = topFolder;
    count = 0;
    while(isdir(curDir)){
      count++;
      nextDir = ls(curDir);
      curDir = strcat(curDir,"/",nextDir(1,1:end));
    }
    //length of paths
    nFolders = "";
    for(int i = 0; i < count; i++){
      nFolders = strcat(nFolders,"/*");
    }

    //getting all files
    filePath = strcat(topFolder,nFolders,".",fileType);
    allFiles = ls(filePath);
    nFiles = length(allFiles);

    % importing data notes
    % A = importdata(allFiles(i,1:end),"\t",1);
    % B = [thing{1}]

    % getting data from all files, storing in struct dataset
    dataset.nFiles = nFiles;
    for i=1:nFiles
      %new data path for each file
      tempData.(strcat("data",(num2str(i)))) = importdata(allFiles(i,1:end),"\t",1); %%%%%%%%%%%%% assumed tab for column separation
      %seting data under header struct
      for(j = 1:length(tempData.(strcat("data",(num2str(i)))).colheaders))
        dataset.(strcat("data",(num2str(i)))).([tempData.(strcat("data",(num2str(i)))).colheaders{j}]) = [tempData.(strcat("data",(num2str(i)))).data(:,j)];
      endfor
    endfor

  }else{
    error('Directory not found, add top directory to working directory');
  }
}