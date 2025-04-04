# Movies & Books Management System - Salesforce
<img src="/mbms-logo.png" alt="MBMS Logo"/>

> [!note]
> ## **1.** Description
> **Movies & Books Management System** Salesforce application was created as part of my engineering thesis. It is a simple application which presents the capabilities of the **Salesforce CRM** cloud platform. At the moment application allows you to manage books, movies, artists and so on.

> [!important]
> ## **2.** Deployment instructions
> To deploy and run this application on your Salesforce Organization you have to:
> - install [git](https://git-scm.com/)
> - install [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
> - create [Hands-On Org](https://trailhead.salesforce.com/users/profiles/orgs) (you need to have a Trailhead account) and get login credentials to the newly created org (it is the easiest way)
> - clone this repo
> ```console
>  git clone https://github.com/artysta/movies-and-books-management-system
>  ```
> - enter the project directory
>  ```console
> cd movies-and-books-management-system
>  ```
> - authorize your org
> ```console
> sf org login web --alias mbms-app
> ```
> - set org as a default one
> ```console
> sf config set target-org mbms-app
> ```
>   - start deployment
>   ```console
>   sf project deploy start
>   ```
>   - (optional) start deployment & run tests
>   ```console
>   sf project deploy start --test-level RunLocalTests
>   ```

> [!tip]
> ## **3.** Sample Data
> You can run the below code in the Apex Anonymous Window to insert sample records to the database.
> ```java
> SampleDataFactory.createAndInsertSampleRecords();
> ```

> [!note]
> ## **4.** Post Deployment Steps
> There are some post deployment steps you should take in order to make this application look and work as it should. Ofcourse these steps are not required, but I just suggest you to take them.
> Add **Home Page** to the app **Navigation Bar**:
> - Click **Personalize your nav bar** (pen icon in the upper right corner on the navigation bar)
> - Click **Add More Items** button
> - Under **Available Items** click **All**
> - Search for **Home**
> - Click "**Plus**" button next to **Home**
> - Click **Add 1 Nav Item button**
> - Click **Save** button

> [!warning]
> ## **5.** TODO
> Things that can be done to increase quality, performance and so on:
> - [ ] Consider using **SOQL For Loops** to iterate and process data from large queries (Queue is pretty bad example but it is just an example) to avoid Heap Size Limit Error.
>  
> e.g. instead of this:
> 
> ```java
> List<Group> queues = [SELECT Name FROM Group WHERE Id IN :userGroupsIds];
>         
> for (Group queue : queues) {
>     return queue.Name == Constants.APPROVERS_QUEUE;
> }
> ```
>  
> do this:
> 
> ```java  
> for (Group queue : [SELECT Name FROM Group WHERE Id IN:userGroupsIds]) {
>     return queue.Name == Constants.APPROVERS_QUEUE;
> }
> ```
