from agents.DQN_agents.DQN_HER import DQN_HER
from environments.j2n6s300.HER_env_tf import j2n6s300_Environment
from agents.Trainer import Trainer
from utilities.data_structures.Config import Config
from datetime import datetime


now = datetime.now() # current date and time
num_episodes_to_run = 500
eps_decay_rate_denom = round(num_episodes_to_run/6)

config = Config()
config.seed = 1
config.environment =  j2n6s300_Environment()
config.num_episodes_to_run = num_episodes_to_run
config.file_to_save_data_results = "Data_and_Graphs/{}jaco.pkl".format(now.strftime("%Y-%m-%d_%H-%M-%S_"))
config.file_to_save_results_graph = "Data_and_Graphs/{}jaco.png".format(now.strftime("%Y-%m-%d_%H-%M-%S_"))
config.show_solution_score = False
config.visualise_results_while_training = True
config.visualise_individual_results = False
config.visualise_overall_agent_results = True
config.standard_deviation_results = 1.0
config.runs_per_agent = 1
config.use_GPU = True
config.overwrite_existing_results_file = False
config.randomise_random_seed = True
config.load_model = False
config.load_model_path = "Models/.pt"
config.save_model = False
config.save_model_path = "Models/{}model.pt".format(now.strftime("%Y-%m-%d_%H-%M-%S_"))


config.hyperparameters = {
    "DQN_Agents": {
        "learning_rate": 0.001,
        "batch_size": 512,
        "buffer_size": 1000000,
        "epsilon_decay_rate_denominator": eps_decay_rate_denom,
        "discount_rate": 0.9,
        "incremental_td_error": 1e-8,
        "update_every_n_steps": 10,
        "linear_hidden_units": [128, 256, 128],
        "final_layer_activation": None,
        "y_range": (-1, 14),
        "batch_norm": False,
        "gradient_clipping_norm": 5,
        "HER_sample_proportion": 0.8,
        "learning_iterations": 2,
        "clip_rewards": False
    }
}

if __name__== '__main__':
    AGENTS = [DQN_HER]
    trainer = Trainer(config, AGENTS)
    trainer.run_games_for_agents()


