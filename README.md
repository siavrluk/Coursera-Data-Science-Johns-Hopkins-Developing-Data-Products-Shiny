# Coursera-Data-Science-Johns-Hopkins-Developing-Data-Products-Shiny

As part of the *Developing Data Products* course from the *JHU Data Science: Statistics and Machine Learning Specialization*, we built a Shiny App which aims at predicting the Happiness Score around the world. 

We used the World Happiness Report which is a landmark survey of the state of global happiness. The happiness scores and rankings use data from the Gallup World Poll.

In order to get a prediction for the happiness score, we built two very simple regression models. The first one uses just the **Life expectancy** as a predictor, and the second one -- **Life expectancy** and **Region**.

In order to use the app, one has to choose the 
- **Life expectancy** (required for both Model1 and Model2) and 
- **Region** (required only for Model2). 

The fitted line from Model1 is depicted in <span style="color:red">red</span>, and the fitted line from Model2 is in <span style="color:blue">blue</span>. The <span style="color:red">red</span> and <span style="color:blue">blue</span> dots correspond to the predictions for the selected **Life expectancy** and **Region** values obtain by Model1 and Model2, resp.

By using the checkboxes in the left panel, one can show or hide the results from Model1 and/or Model2.


The app can be found at https://siavrluk.shinyapps.io/HapinessScorePrediction/
