clear
% prepare 4-D images for decoding
% spm_vol % read hdr
% spm_read_vols % read img from hdr
% spm_write_vol % writes an img

% this code concatenates the 4-D maps in the order as below
% handDown, handUp, visual

%%
smoothing = '0';
subNb = '005';
%% for beta images

% get the different 4-D beta images
betaFileA=strcat('prep4D/sub-', subNb,'/stats/task-handDown_space-MNI_FWHM-',smoothing,'/sub-', subNb,'_task-handDown_space-MNI_FWHM-',smoothing,'_4D_beta.nii');
betaFileB=strcat('prep4D/sub-', subNb,'/stats/task-handUp_space-MNI_FWHM-',smoothing,'/sub-', subNb,'_task-handUp_space-MNI_FWHM-',smoothing,'_4D_beta.nii');
betaFileC=strcat('prep4D/sub-', subNb,'/stats/task-visual_space-MNI_FWHM-',smoothing,'/sub-', subNb,'_task-visual_space-MNI_FWHM-',smoothing,'_4D_beta.nii');

%read the header
hdr_betaFileA = spm_vol(betaFileA);
hdr_betaFileB = spm_vol(betaFileB);
hdr_betaFileC = spm_vol(betaFileC);

%get their volumes
vol_betaFileA = spm_read_vols(hdr_betaFileA);
vol_betaFileB = spm_read_vols(hdr_betaFileB);
vol_betaFileC = spm_read_vols(hdr_betaFileC);

%concatenate them
betaFoR_4D = cat(4, vol_betaFileA, vol_betaFileB, vol_betaFileC);

% split 4-D images and then merge them back
for i = 1:size(betaFoR_4D, 4)
    hdr_betaFoR_4D = hdr_betaFileA(1); %use the hdr from any of the previous 4-D images
    %new split betas start with "C"
    hdr_betaFoR_4D.fname = ['C' sprintf('%02.0f', i) '.nii']; %rename the hdr so that we create and save a new file/image and not overwrite
    
    spm_write_vol(hdr_betaFoR_4D, betaFoR_4D(:,:,:,i));
    
end

%choose all the images that start with C and end with .nii
images = spm_select('FPlist', pwd , '^C.*.nii'); 
%merge the images into one
spm_file_merge(images, strcat('sub-', subNb,'_FoR2_4D_beta_',smoothing,'.nii'))

%delete the extra images

%% for t-maps

% get the different 4-D tmap images
tmapFileA=strcat('prep4D/sub-', subNb,'/stats/task-handDown_space-MNI_FWHM-',smoothing,'/sub-', subNb,'_task-handDown_space-MNI_FWHM-',smoothing,'_4D_tmap.nii');
tmapFileB=strcat('prep4D/sub-', subNb,'/stats/task-handUp_space-MNI_FWHM-',smoothing,'/sub-', subNb,'_task-handUp_space-MNI_FWHM-',smoothing,'_4D_tmap.nii');
tmapFileC=strcat('prep4D/sub-', subNb,'/stats/task-visual_space-MNI_FWHM-',smoothing,'/sub-', subNb,'_task-visual_space-MNI_FWHM-',smoothing,'_4D_tmap.nii');

%read the header
hdr_tmapFileA = spm_vol(tmapFileA);
hdr_tmapFileB = spm_vol(tmapFileB);
hdr_tmapFileC = spm_vol(tmapFileC);

%get their volumes
vol_tmapFileA = spm_read_vols(hdr_tmapFileA);
vol_tmapFileB = spm_read_vols(hdr_tmapFileB);
vol_tmapFileC = spm_read_vols(hdr_tmapFileC);

%concatenate them
tmapFoR_4D = cat(4, vol_tmapFileA, vol_tmapFileB, vol_tmapFileC);

% split 4-D images and then merge them back
for i = 1:size(tmapFoR_4D, 4)
    hdr_tmapFoR_4D = hdr_tmapFileA(1); %use the hdr from any of the previous 4-D images
    %new split tmaps start with "C"
    hdr_tmapFoR_4D.fname = ['C' sprintf('%02.0f', i) '.nii']; %rename the hdr so that we create and save a new file/image and not overwrite
    
    spm_write_vol(hdr_tmapFoR_4D, tmapFoR_4D(:,:,:,i));
    
end

%choose all the images that start with C and end with .nii
images = spm_select('FPlist', pwd , '^C.*.nii'); 
%merge the images into one
spm_file_merge(images, strcat('sub-', subNb,'_FoR2_4D_tmap_',smoothing,'.nii'))

%delete the extra images