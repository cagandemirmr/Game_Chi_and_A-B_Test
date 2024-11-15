# Game_Analysis

## Importing Data 

I create table and import CSV files with indicating path.
![image](https://github.com/user-attachments/assets/9462f787-fe4d-4c21-a3c1-bae1578719e1)

## About The Data

All datas created artifically on ChatGPT.There are 4  CSV Tables which are exp_analysis,game_actions,game_purchases and game_users.

Iexp_assigments table  has 100.172 Rows and 4 columns which are  exp_name,user_id,exp_date,variant.

exp_name has "Onboarding" variable.

user_id is consist of 100.172 distinct values.

exp_date has 50 distinct values.And  oldest date is "2020-01-01", newest date is "2020-02-19".

variant has 2 variables which are variant1 and control group.


Game actions consist of 124.185 Rows and 3 categories which are  user_id,action and action_date.

action column has "onboarding complete" and "email_optin" variables. User_id has 87.124 variables.Also action date has 50 variables and  while oldest date is "2020-01-01", newest date is "2020-02-19"


Game_purchases have 12.897 Rows and 3 columns which are user_id,purch_date and amount.

user_id has 9.969 distinct values.

purch_date has 70 values.Oldest date is "2020-01-01" and newest date is "2020-03-11".

Amount has 6 distinct values which are 2.99, 50 ,25, 999, 100, 10.


![image](https://github.com/user-attachments/assets/bfdcbec4-530d-4563-b220-d062bb2e04bd)

I calculated chi square with these results on a website to see which one is more succesful.According to this result, variant 1 is much more succesful compared to control group.

![image](https://github.com/user-attachments/assets/b8a54e15-0217-4110-a2fd-e119da9e37ae)

We find results but we need to find basic parameters like mean and standart deviation to calculate chi square for my own.

So i calculate this measures with avg and stddev functions.

![image](https://github.com/user-attachments/assets/38c7e657-1e3a-4807-a017-7074245697f5)

When i calcualted these results online, i can see that there is no significant difference between variant1 and control.

To calculate total number of gamer on boarding i join game_actions table. Accoring to results i do not accept null hypotesis that means there is a difference between two categories.

![image](https://github.com/user-attachments/assets/936f0a90-29c8-4f3a-a080-2f19f422bb39)


But as a succes metric, i define purchase thus i recreated calculation.According to test, it shows that there is difference between two categories.

![image](https://github.com/user-attachments/assets/7364925b-6b08-4f50-9457-0b68e05cdf5d)

In terms of 7 day interval, There is no difference between them.

![image](https://github.com/user-attachments/assets/d6d550a9-9c61-4fcb-9d35-e2222e212674)

If i make test on two different period whether there is a significant difference between two periods.
I can see that there is a significant difference between these results.

![image](https://github.com/user-attachments/assets/4ed2b317-00de-4e97-9f18-7ce25ad4c1f2)

But it can not be reliable because of planned and unexpected events.

If I tried to compare two different countries like Canada and USA.
I can get this results.

![image](https://github.com/user-attachments/assets/71d84b24-312a-4b6d-8f3b-f4bfdbda2f95)

Whether there is a significant difference  it can be tricky because these countries do not have same amount of population, etc.
