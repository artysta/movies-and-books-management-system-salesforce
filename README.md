# Movies & Books Management System - Salesforce

## **#1** Description

**Movies & Books Management System** Salesforce application was created as part of my engineering thesis. It is a simple application which presents the capabilities of the **Salesforce CRM** cloud platform. At the moment application allows you to manage books, movies, artists and so on.

## **#2** Deployment instructions

To deploy and run this application on your Salesforce Organization you have to:

 - install [git](https://git-scm.com/)
 
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

## **#3** Sample Data

You can run the below code in the Apex Anonymous Window to insert sample records to the database.

```console
SampleDataFactory.createAndInsertSampleRecords();
```

## **#4** Post Deployment Steps

There are some post deployment steps you should take in order to make this application look and work as it should. Ofcourse these steps are not required, but I just suggest you to take them.

Add **Home Page** to the app **Navigation Bar**:

 - Click **Personalize your nav bar** (pen icon in the upper right corner on the navigation bar)
 - Click **Add More Items** button
 - Under **Available Items** click **All**
 - Search for **Home**
 - Click "**Plus**" button next to **Home**
 - Click **Add 1 Nav Item button**
 - Click **Save** button
