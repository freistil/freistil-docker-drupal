freistil-docker-template
========================

_Docker image template_


Creating a new build
--------------------

In order to create a new Docker build from this template, clone its repository and change the remote name to "upstream":

    git remote rename origin upstream

Create a new repository for your project and add it as your "origin" remote:

    git remote add origin <URL>

Remove this section from the README, commit and push:

    git push -u origin

__Happy dockerising!__


Building the Docker image
-------------------------

To create the image `freistil/template`, execute the following command on the freistil-docker-template folder:

	make build

You can now push your new image to the registry:

	make push


Running the Docker image
------------------------

	make run
