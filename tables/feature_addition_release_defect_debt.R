to extract release and number of feature addition 
# select release,  count(*) from git_commit_classification where classification='Feature Addition' group by 1 order by release;

to extract the number of Defect Debt, do in R
# bugfix_distribution <- read.csv("~/git/soen6611_course_project/bugfix_distribution.csv", header=TRUE)

# #loop creating new variables for each row in the file, load the values in oercentage, create a bar plot in the home directory
# for(i in 1:41) { 
#   variable_name <- paste("r", i,  sep = "")
#   pdf(paste(variable_name, "pdf", sep = "."))
#   barplot(assign(variable_name, as.matrix(bugfix_distribution[i,3:41]/bugfix_distribution[i,2])))
#   dev.off()
# };

# for(i in 1:41) { 
#   variable_name <- paste("r", i,  sep = "")
#   pdf(paste(variable_name, "pdf", sep = "."))
#   barplot(assign(variable_name, as.matrix(bugfix_distribution[i,3:41])))
#   dev.off()
# };

# #Get all the values in memory and sum them:
# #the current release + current release + 1 for bugs 
# #the third release forward for defect debt
# for(i in 1:37) {
#   in_memory_var <- paste("r", i,  sep = "")
#   temp_var <- get(in_memory_var)
#   ddebt_variable_name <- paste(in_memory_var, "defect_debt_sum", sep = "_")
#   bugs_variable_name <- paste(in_memory_var, "bug_sum", sep = "_")
#   assign(ddebt_variable_name, sum(temp_var[1,(i+2):39]))
#   assign(bugs_variable_name, sum(temp_var[1,(i): (1+i)]))
# };

# dd <- c(r1_defect_debt_sum,  r2_defect_debt_sum,  r3_defect_debt_sum,  r4_defect_debt_sum,  r5_defect_debt_sum, r6_defect_debt_sum, 
#         r7_defect_debt_sum,  r8_defect_debt_sum,  r9_defect_debt_sum, r10_defect_debt_sum, r11_defect_debt_sum, r12_defect_debt_sum,
#         r13_defect_debt_sum, r13_defect_debt_sum, r14_defect_debt_sum, r15_defect_debt_sum, r16_defect_debt_sum, r17_defect_debt_sum,
#         r18_defect_debt_sum, r19_defect_debt_sum, r20_defect_debt_sum, r21_defect_debt_sum, r22_defect_debt_sum, r23_defect_debt_sum, 
#         r24_defect_debt_sum)


# plot(dd, type="o", col="blue", xlab="Release number", ylab="defect debt")




# #calculate the mean for defect debt
# mean( r1_defect_debt_sum,  r2_defect_debt_sum,  r3_defect_debt_sum,  r4_defect_debt_sum,  r5_defect_debt_sum, r6_defect_debt_sum, 
#       r7_defect_debt_sum,  r8_defect_debt_sum,  r9_defect_debt_sum, r10_defect_debt_sum, r11_defect_debt_sum, r12_defect_debt_sum,
#       r13_defect_debt_sum, r13_defect_debt_sum, r14_defect_debt_sum, r15_defect_debt_sum, r16_defect_debt_sum, r17_defect_debt_sum,
#       r18_defect_debt_sum, r19_defect_debt_sum, r20_defect_debt_sum, r21_defect_debt_sum, r22_defect_debt_sum, r23_defect_debt_sum, 
#       r24_defect_debt_sum, r25_defect_debt_sum, r26_defect_debt_sum)

# #calculate the mean for bugs
# mean( r1_bug_sum,  r2_bug_sum,  r3_bug_sum,  r4_bug_sum,  r5_bug_sum, r6_bug_sum, 
#       r7_bug_sum,  r8_bug_sum,  r9_bug_sum, r10_bug_sum, r11_bug_sum, r12_bug_sum,
#       r13_bug_sum, r13_bug_sum, r14_bug_sum, r15_bug_sum, r16_bug_sum, r17_bug_sum,
#       r18_bug_sum, r19_bug_sum, r20_bug_sum, r21_bug_sum, r22_bug_sum, r23_bug_sum, 
#       r24_bug_sum, r25_bug_sum, r26_bug_sum)


# table 
\begin{table}[!hbt]
      \begin{center}
            \caption{Bad smells breakdown from each analyzed project}
            \label{tab:bad_smell_evolution_overview}
            \begin{tabular}{l| c c }
            \toprule
            \textbf{Release}  & \textbf{Feature Addition} & \textbf{Defect Debt} \\ \midrule 
              1  & 1046 & 598   \\ 
              2  & 622 & 560    \\ 
              3  & 487 & 1044   \\ 
              4  & 520 & 604    \\ 
              5  & 463 & 800    \\ 
              6  & 185 & 465    \\ 
              7  & 163 & 530    \\ 
              8  & 187 & 582    \\ 
              9  & 148 & 377    \\ 
             10  & 253 & 606    \\ 
             11  & 201 & 427    \\ 
             12  & 313 & 763    \\ 
             13  & 255 & 561    \\ 
             14  & 230 & 561    \\ 
             15  & 315 & 849    \\ 
             16  & 274 & 789    \\ 
             17  & 367 & 876    \\ 
             18  & 354 & 687    \\ 
             19  & 287 & 946    \\ 
             20  & 228 & 738    \\ 
             21  & 398 & 498    \\ 
             22  & 288 & 882    \\ 
             23  & 475 & 438    \\ 
             24  & 394 & 642    \\ 
             25  & 278 & 390    \\ \bottomrule
            \end{tabular}
      \end{center}
\end{table}


create summary table with project details
select a.release_number, a.tag, a.release_date, count(b.commit) as commits from releases a , git_commit_classification b where a.release_number = b.release group by 1 order by 1;
select a.release_number, count(b.commit) as bug_reported from releases a , bugfix_commits b where a.release_number = b.bug_report_release group  by 1 order by 1;
select a.release_number, count(b.commit) as bug_fixed from releases a , bugfix_commits b where a.release_number = b.commit_release group  by 1 order by 1;            

#table 
\begin{table}[!hbt]
      \begin{center}
            \caption{Bad smells breakdown from each analyzed project}
            \label{tab:project_details}
            \begin{tabular}{l| l c c c c }
            \toprule
            \textbf{Release} &  \textbf{Tag}  & \textbf{Date} & \textbf{\# of Commits} & \textbf{\# of Bug repoted} & \textbf{\# of Bug Fixed} \\ \midrule 

              1 & 1.0.154.36    & 2008-12-11   &    7705 &         1964 &      1014 //
              2 & 2.0.172.28    & 2009-05-21   &    8015 &         3061 &      2493 //
              3 & 3.0.195.21    & 2009-09-15   &    8583 &         4542 &      3669 //
              4 & 4.0.249.78    & 2010-01-25   &    8045 &         3799 &      3710 //
              5 & 5.0.375.55    & 2010-05-25   &    7603 &         3590 &      3464 //
              6 & 6.0.472.53    & 2010-09-02   &    3457 &         1739 &      1696 //
              7 & 7.0.517.43    & 2010-10-19   &    3376 &         1624 &      1423 //
              8 & 8.0.552.215   & 2010-12-02   &    3990 &         1850 &      1703 //
              9 & 9.0.597.84    & 2011-02-03   &    2703 &         1210 &      1191 //
             10 & 10.0.648.127  & 2011-03-08   &    4671 &         1992 &      1833 //
             11 & 11.0.696.57   & 2011-04-27   &    4083 &         1606 &      1587 //
             12 & 12.0.742.91   & 2011-06-07   &    5198 &         2511 &      2263 //
             13 & 13.0.782.107  & 2011-08-02   &    4541 &         1999 &      2082 //
             14 & 14.0.835.163  & 2011-09-16   &    4077 &         2398 &      1840 //
             15 & 15.0.874.102  & 2011-10-25   &    5505 &         2900 &      2814 //
             16 & 16.0.912.63   & 2011-12-13   &    5036 &         3033 &      2670 //
             17 & 17.0.963.46   & 2012-02-08   &    6624 &         3365 &      3775 //
             18 & 18.0.1025.142 & 2012-03-28   &    5798 &         3537 &      3098 //
             19 & 19.0.1084.52  & 2012-05-15   &    5395 &         2895 &      3141 //
             20 & 20.0.1132.43  & 2012-06-26   &    3865 &         2211 &      2174 //
             21 & 21.0.1180.57  & 2012-07-31   &    7187 &         4012 &      4337 //
             22 & 22.0.1229.79  & 2012-09-25   &    5247 &         2808 &      2927 //
             23 & 23.0.1271.83  & 2012-11-02   &    7967 &         4108 &      4614 //
             24 & 24.0.1312.52  & 2013-01-10   &    5707 &         2753 &      3541 //
             25 & 25.0.1364.97  & 2013-02-21   &    5009 &         2129 &      3019 // /bottomrule
            \end{tabular}
      \end{center}
\end{table}


 


