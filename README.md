# movies-and-books-management-system

To deploy and run this application on your Salesforce Organization you have to:

 - install [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)

 - create a Hands-On Org (Trailhead Playground) and get your login credentials (it is the easiest way)

 - clone this repo

    ```console
    git clone https://github.com/artysta/movies-and-books-management-system
    ```

 - enter the project directory

    ```console
    cd movies-and-books-management-system
    ```
    
 - create a sfdx project

    ```console
    sfdx force:project:create -n ./
    ```
 
 - authorize your org

    ```console
    sfdx auth:web:login -a mbms-app
    ```

 - set org as a default one

    ```console
    sfdx force:config:set defaultusername=mbms-app
    ```

 - deploy the application files
 
    ```console
    sfdx force:mdapi:deploy --deploydir ./src
    ```

## **#2** Post Deployment Steps:

Add **Home Page** to the app **Navigation Bar**:

 - Click **Personalize your nav bar** (pen icon in the upper right corner on the navigation bar)
 - Click **Add More Items** button
 - Under **Available Items** click **All**
 - Search for **Home**
 - Click "**Plus**" button next to **Home**
 - Click **Add 1 Nav Item button**
 - Click **Save** button
