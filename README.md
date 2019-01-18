# Azure-Databricks-auto-sklearn
Shows how to install auto-sklearn on an Azure Databricks cluster


# Create a new Azure Databricks workspace
- You can use an existing workspace, but make sure you do not have lots of Libraries attached.  It is usually best to do in a clean workspace.


# Install Databricks CLI
- https://docs.databricks.com/user-guide/dev-tools/databricks-cli.html
- I perfer using the CLI since you do not need a cluster running to upload init scripts. You can created init scripts with a notebook, but sometimes they cause formatting issues of the file and the init script fails.


# Upload the autosklearn.sh script
- You do not need a cluster running, start a command prompt
- databricks configure --token {PLACE YOUR TOKEN HERE}
- dbfs mkdirs dbfs:/databricks/init/{clusterName-case-sensitive}
- dbfs rm dbfs:/databricks/init/{clusterName-case-sensitive}/autosklearn.sh
- dbfs cp autosklearn.sh dbfs:/databricks/init/{clusterName-case-sensitive}/autosklearn.sh
- dbfs ls dbfs:/databricks/init/{clusterName-case-sensitive}/


# Create a cluster
- Must match the name that you just uploaded the script
- Select Python version 3
- Start the cluster

Create-Cluster.png

# Attach the library
- Once the cluster has started
- Go to your workspace and add the library

Create-Library.png
Install-Library.png

# To clean up lots of libraries on your cluster
- If you install a Databricks Library the defualt says "Install on all clusters".  This can cause issues like slow startup times and libraries failing to install properly due to conflicts.
- To cleanly install a library, start the cluster, then install the library and check off the cluster.
- What if you cannot uncheck the box:
   - Go to the library (if the library is not installed, then just reinstall).  Uninstalling a library from a workspace does not mean the library will be removed from existing clusters.
   - Uncheck install on all clusters
   - The move to trash
   - Then go to EACH cluster and click on Libraries tab and check the library and click Uninstall