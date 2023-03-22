# sanni-shafeeq-techtask-mobile
This project is basically an application that  suggest varieties of lunch to user based on the items selected from the fridge. The application also tells the user if the selected item has expired or would have expired based on the desired lunch date the user selects. 

APP USAGE INSTANCE

1. When app lunches the user is taken to the home screen where he can trigger the open friged button. the open fridge calls the get ingredent end point and return data based on the information fetched from the api. 

2. if the api call is succesfull it renders the result and tags the epired items as "expired" based on the selected lunch date. Also, if there was an error, the error screen is rendered.

3. the user can select the ingredients desired and click on the floating action button to get suggeted lunch. the suggest Lucnch function is triggered while a loading state shows on the app.

4. If there is an error in the process, a dialog shows with an error message. if the api call is successful, the app navigates to the suggested lunch screen.

5. The user sees an array of suggetsed lunch and he can click on the recipes button to view a full information of the individual suggeted item.

DEMO INSTACE OF UNEXPIRED ITEMS


https://user-images.githubusercontent.com/62085280/226823324-28f2677f-76cf-437f-8278-3e747d3fd844.mp4



DEMO INSTACE OF EXPIRED ITEMS

https://user-images.githubusercontent.com/62085280/226823407-cc6d2568-052d-4c44-b289-90e8260917eb.mp4

