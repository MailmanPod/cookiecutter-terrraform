import cookiecutter.main as ccmain
import json
import os
from shutil import copyfile

# Copy the cookiecutter.json from central location to all templates, so we won't need to update each cookiecutter.json
# template manually.
sub_templates = ['./main_template',
                 './environment_template']

env_config = {
    "environment": ""
}

# Load the custom config file.
with open('config.json') as f_config:
    config = json.load(f_config)

# Copy cookiecutter json file to both template folders
for template in sub_templates:
    copyfile('./cookiecutter.json', os.path.join(template, 'cookiecutter.json'))


# Create the project using the primary template.
ccmain.cookiecutter('main_template',
                    no_input=True,
                    extra_context=config,
                    output_dir=os.path.join(config['project_path']))

# For each table, create a table folder using the sub template.
for env in config['environments']:
    env_config['environment'] = env['name']  # Used for cookiecutter.json

    # Create the sub folder using the sub template in the correct location
    ccmain.cookiecutter('environment_template',
                        no_input=True,
                        extra_context=env_config,  # Override the table attribute in the cookiecutter.json
                        output_dir=os.path.join(config['project_path'], config['project_name'], 'environments'))
