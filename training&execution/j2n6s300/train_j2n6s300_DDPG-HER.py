from environments.j2n6s300.DDPG_HER_env_Gazebo import j2n6s300_Environment
from agents.actor_critic_agents.DDPG_HER import DDPG_HER
from utilities.data_structures.Config import Config
from agents.Trainer import Trainer
from datetime import datetime
import os

now = datetime.now() # current date and time
date_str = now.strftime("%Y-%m-%d_%H-%M-%S")
os.mkdir('Data_and_Graphs/results_' + date_str)
path = 'Data_and_Graphs/results_' + date_str + '/'


config = Config()
config.seed = 1
config.environment = j2n6s300_Environment(proxyID='Env1')
config.num_episodes_to_run = 3000
config.file_to_save_config = path + "config.json"
config.file_to_save_data_results = path + "jaco_DDPG-HER.pkl"
config.file_to_save_results_graph = path + "jaco_DDPG-HER.png"
config.show_solution_score = False
config.visualise_results_while_training = True
config.visualise_individual_results = True
config.visualise_overall_agent_results = True
config.standard_deviation_results = 1.0
config.runs_per_agent = 5
config.use_GPU = True
config.overwrite_existing_results_file = False
config.randomise_random_seed = True
config.load_model = False
config.load_model_path = "Models/model.pt"
config.save_model = False
config.save_model_path = "Models/{}model.pt".format(now.strftime("%Y-%m-%d_%H-%M-%S_"))

config.hyperparameters = {

"Actor_Critic_Agents": {
    "Actor": {
        "learning_rate": 0.001,
        "linear_hidden_units": [64, 64],
        "final_layer_activation": "TANH",
        "batch_norm": False,
        "tau": 0.01,
        "gradient_clipping_norm": 5
    },

    "Critic": {
        "learning_rate": 0.01,
        "linear_hidden_units": [64, 128, 64],
        "final_layer_activation": None,
        "batch_norm": False,
        "buffer_size": 1000000,
        "tau": 0.01,
        "gradient_clipping_norm": 5
    },

    "batch_size": 1024,
    "discount_rate": 0.9,
    "mu": 0.0,
    "theta": 0.15,
    "sigma": 0.25,
    "update_every_n_steps": 10,
    "learning_updates_per_learning_session": 10,
    "HER_sample_proportion": 0.8,
    "clip_rewards": False
}}


if __name__== '__main__':
    AGENTS = [DDPG_HER]
    trainer = Trainer(config, AGENTS)
    trainer.run_games_for_agents()

