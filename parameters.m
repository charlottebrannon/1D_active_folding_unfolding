%%%%%%%%% parameters %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % This script is where the parameters    % % 
% % of the simulation are set. A params    % %  
% % struct is generates and parameters     % % 
% % are hard coded here. If running        % % 
% % run_param_sweep or unit_testing,       % %
% % these values will need to be           % %
% % overwritten.                           % %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% % Initialize parameters structure
params = {};

% % Set directory for saving output kymograph and energy plots
params.savedir = "/Volumes/GoogleDrive/My Drive/prakash_lab_charlotte/tplax_unfolding/1D_sim_out/contact_area_vs_time/zero_activity_50_replicates/";
params.savefile = true;

% % Set how long to let the simulation run for
params.manual_cutoff = 50;

% % Set initial condition for sheet
%params.sheet = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
%params.sheet = [0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0];


params.sheet = zeros(1, 200);
params.sheet(80:120) = 1;

%params.sheet = zeros(1, 100);
%params.sheet(40:60) = 1;

% % Set remaining parameters
params.E_cc = 10000; % energy per 1 unit of cilia:cilia contact
params.E_cs = 10000; % energy per 1 unit of cilia:substrate contact
params.a_cs = 0; % activity 1000000
params.a_rand = 0; % activity orientation randomness
params.E_f = params.E_cc; % energy of 1 free cilia
params.E_tw = 100; % energy per 1 unit of twist
params.nucl_prob = 0; % probability of random fold nucleation; val between 0 and 1 / SHOULD BE KEPT VERY LOW
params.flocking_coherence_time = 1; % num timesteps that cilia orientations are maintained / 1 - Inf
params.flocking_mode = 1; % 1 = patches are broken by folding motifs; % 2 = sheet has one patch (all cilia point in the same dir)


params.E = 1; % Young's modulus
params.t = 0.001; % sheet thickness
params.L = length(params.sheet); % sheet length
params.epsilon = 0.001; % sheet bendability
params.delta = 1; % sheet compression
params.lbc = 1; % bendo-capillary length


% % Get fold and twist id's 
[fold_ids,twist_ids] = getFeatureIDs(params.sheet);
params.fold_ids = fold_ids;
params.twist_ids = twist_ids;

% % Set case id for unit_testing only
params.case_id = "";