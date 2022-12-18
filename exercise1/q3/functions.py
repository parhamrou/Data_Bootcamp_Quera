import numpy as np
import pandas as pd
def survival_chance(titanic_df,start_age,end_age):
    Survived = titanic_df.Survived.tolist()
    Ages = titanic_df.Age.to_list()
    Sex = titanic_df.Sex.tolist()
    chances = {"male": 0, "female": 0}
    total_gender = {"male": 0, "female": 0}
    for index, age in enumerate(Ages):
        if (~np.isnan(age)) and age >= start_age and age <= end_age:
            sex = Sex[index]
            total_gender[sex] += 1
            if Survived[index] == 1:
                chances[sex] += 1
    for sex in chances.keys():
        chances[sex] = -1 if total_gender[sex] == 0 else round(chances[sex] / total_gender[sex], 3)
    return chances