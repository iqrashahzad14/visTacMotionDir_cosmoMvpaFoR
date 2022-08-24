clear ;
clc;

%% set paths
  % spm
  warning('off');
  addpath(genpath('/Users/shahzad/Documents/MATLAB/spm12'));
  % cosmo
  cosmo = '~/Documents/MATLAB/CoSMoMVPA';
  addpath(genpath(cosmo));
  cosmo_warning('once');

  % libsvm
  libsvm = '~/Documents/MATLAB/libsvm';
  addpath(genpath(libsvm));
  % verify it worked.
  cosmo_check_external('libsvm'); % should not give an error
  
  % add cpp repo
  run ../../visTacMotionDir_fMRI_analysis/src/../lib/CPP_SPM/initCppSpm.m;
     
  % load your options
  opt = getOptionMvpa();

%% run mvpa 
  
%   accuracy = calculateMvpa(opt, roiSource);
%   maskVoxel = calculateMaskSize(opt);
    
%   take the most responsive xx nb of voxels
  opt.mvpa.ratioToKeep = 200;% % 120, 224, 368, 100 150 250 350 420
  
  accuracyDirectionSelectivity = calculateMvpaWithinHand(opt);
  accuracyFoR = calculateMvpaAcrossHandAnatExt(opt);
%     accuracyFoR=Copy_of_calculateMvpaAcrossHandAnatExt(opt);
  