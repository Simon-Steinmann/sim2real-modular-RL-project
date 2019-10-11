class Config(object):
    """Object to hold the config requirements for an agent/game"""
    def __init__(self):
        self.seed = None
        self.environment = None
        self.requirements_to_solve_game = None
        self.num_episodes_to_run = None
        self.file_to_save_data_results = None
        self.file_to_save_results_graph = None
        self.file_to_save_config = None
        self.runs_per_agent = None
        self.visualise_results_while_training = False
        self.visualise_overall_results = None
        self.visualise_individual_results = None
        self.hyperparameters = None
        self.use_GPU = None
        self.overwrite_existing_results_file = None
        self.save_model = False
        self.standard_deviation_results = 1.0
        self.randomise_random_seed = True
        self.show_solution_score = False
        self.debug_mode = False
        self.load_model_path = None               # All other models (DQN)
        self.actor_model_path = None              #Actor-Critic methods only (DDPG)
        self.critic_model_path = None             #Actor-Critic methods only (DDPG)
        self.save_model = False
        self.save_model_path = None
        