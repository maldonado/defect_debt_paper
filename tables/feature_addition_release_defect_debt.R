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

\begin{table*}[!hbt]
      \begin{center}
            \caption{Project details}
            \label{tab:project_details}
            \begin{tabular}{l| c c c c c}
            \toprule
            \textbf{Release}  & \textbf{Tag} & \textbf{Date} & \textbf{\# of commits} & \textbf{\# of Bug Reported} & \textbf{\# of Bug Fixed} \\ \midrule 
              1               & 1.0.154.36    & 2008-12-11   &    7705                &         1964                &      1014 \\
              2               & 2.0.172.28    & 2009-05-21   &    8015                &         3061                &      2493 \\
              3               & 3.0.195.21    & 2009-09-15   &    8583                &         4542                &      3669 \\
              4               & 4.0.249.78    & 2010-01-25   &    8045                &         3799                &      3710 \\
              5               & 5.0.375.55    & 2010-05-25   &    7603                &         3590                &      3464 \\
              6               & 6.0.472.53    & 2010-09-02   &    3457                &         1739                &      1696 \\
              7               & 7.0.517.43    & 2010-10-19   &    3376                &         1624                &      1423 \\
              8               & 8.0.552.215   & 2010-12-02   &    3990                &         1850                &      1703 \\
              9               & 9.0.597.84    & 2011-02-03   &    2703                &         1210                &      1191 \\
             10               & 10.0.648.127  & 2011-03-08   &    4671                &         1992                &      1833 \\
             11               & 11.0.696.57   & 2011-04-27   &    4083                &         1606                &      1587 \\
             12               & 12.0.742.91   & 2011-06-07   &    5198                &         2511                &      2263 \\
             13               & 13.0.782.107  & 2011-08-02   &    4541                &         1999                &      2082 \\
             14               & 14.0.835.163  & 2011-09-16   &    4077                &         2398                &      1840 \\
             15               & 15.0.874.102  & 2011-10-25   &    5505                &         2900                &      2814 \\
             16               & 16.0.912.63   & 2011-12-13   &    5036                &         3033                &      2670 \\
             17               & 17.0.963.46   & 2012-02-08   &    6624                &         3365                &      3775 \\
             18               & 18.0.1025.142 & 2012-03-28   &    5798                &         3537                &      3098 \\
             19               & 19.0.1084.52  & 2012-05-15   &    5395                &         2895                &      3141 \\
             20               & 20.0.1132.43  & 2012-06-26   &    3865                &         2211                &      2174 \\
             21               & 21.0.1180.57  & 2012-07-31   &    7187                &         4012                &      4337 \\
             22               & 22.0.1229.79  & 2012-09-25   &    5247                &         2808                &      2927 \\
             23               & 23.0.1271.83  & 2012-11-02   &    7967                &         4108                &      4614 \\
             24               & 24.0.1312.52  & 2013-01-10   &    5707                &         2753                &      3541 \\
             25               & 25.0.1364.97  & 2013-02-21   &    5009                &         2129                &      3019 \\ \bottomrule
            \end{tabular}
      \end{center}
\end{table*}

# correlation table
\begin{table}[!hbt]
      \begin{center}
            \caption{Correlation for Defect Debt}
            \label{tab:project_details}
            \begin{tabular}{l| c}
            \toprule
            \textbf{Metric}  & \textbf{Value} \\ \midrule                                         
            corrective\_commit                      &                      0.768 \\ 
            feature\_add\_commit                     &                      0.419 \\ 
            log(non\_functional\_commit +1)                  &              0.680 \\ 
            perfective\_commit                      &                      0.579 \\ 
            preventative\_commit                    &                      0.667 \\ 
            t\_churn                                &                      0.527 \\ 
            t\_dev                                  &                      0.427 \\ 
            dev\_join                               &                      0.509 \\ 
            log(dev\_left + 1)                               &             0.661 \\ 
            complexity                             &                      0.950 \\ 
            loc                                    &                      0.947 \\ 
            log(bug\_report\_reply + 1)                       &             0.644 \\ 
            bug\_reported\_two\_weeks\_pre\_release     &                      0.493 \\ 
            file\_changes                           &                      0.754 \\  \bottomrule
            \end{tabular}
      \end{center}
\end{table}


Coefficients:
                                     Estimate Std. Error t value Pr(>|t|)
(Intercept)                        -1.992e+02  3.578e+03  -0.056    0.965
corrective_commit                  -2.220e-01  5.823e-01  -0.381    0.768
feature_add_commit                  6.603e+00  5.097e+00   1.295    0.419
log(non_functional_commit + 1)      4.603e+01  8.365e+01   0.550    0.680
perfective_commit                  -6.493e+00  8.351e+00  -0.778    0.579
preventative_commit                -2.227e+00  3.862e+00  -0.577    0.667
t_churn                            -2.125e-03  2.316e-03  -0.917    0.527
t_dev                              -5.491e+00  4.360e+00  -1.259    0.427
dev_join                            5.421e+00  5.577e+00   0.972    0.509
log(dev_left + 1)                  -3.330e+01  5.658e+01  -0.589    0.661
complexity                         -7.890e-03  1.003e-01  -0.079    0.950
loc                                 7.993e-04  9.564e-03   0.084    0.947
log(bug_report_reply + 1)           1.618e+02  2.584e+02   0.626    0.644
bug_reported_two_weeks_pre_release  7.504e-01  7.330e-01   1.024    0.493
file_changes                        3.874e-02  9.523e-02   0.407    0.754

Residual standard error: 134 on 1 degrees of freedom
Multiple R-squared:  0.9795,  Adjusted R-squared:  0.6932 
F-statistic:  3.42 on 14 and 1 DF,  p-value: 0.4028



\begin{table*}[!hbt]
      \begin{center}
            \caption{Metric details Part I}
            \label{tab:metrics_details_1}
            \begin{tabular}{l| c c c c c c c c}
            \toprule
            \textbf{Release}  & \textbf{corrective} & \textbf{feature\_add} & \textbf{merge} & \textbf{non\_functional} & \textbf{perfective} & \textbf{preventative}  & \textbf{not\_classified}  & \textbf{t\_churn} \\ \midrule  
                  10          &                       2878 &                         253 &                    28 &                              5 &                         54 &                            84 &                     1283 &   793600 \\
                  11          &                       2337 &                         201 &                    25 &                              4 &                         30 &                            63 &                     1121 &   477210 \\
                  12          &                       3229 &                         313 &                    39 &                             15 &                         39 &                           108 &                     1443 &   840984 \\
                  13          &                       2829 &                         255 &                    25 &                              8 &                         37 &                            86 &                     1301 &   505683 \\
                  14          &                       2493 &                         230 &                    14 &                              1 &                         32 &                            59 &                     1248 &   443070 \\
                  15          &                       3280 &                         315 &                    31 &                              8 &                         67 &                           120 &                     1684 &   775464 \\
                  16          &                       3117 &                         274 &                    41 &                              2 &                         60 &                           129 &                     1413 &   601545 \\
                  17          &                       4073 &                         367 &                    25 &                             13 &                        105 &                            86 &                     1955 &   821351 \\
                  18          &                       3631 &                         354 &                    45 &                             12 &                         43 &                           123 &                     1590 &   682760 \\
                  19          &                       3400 &                         287 &                    30 &                             16 &                         56 &                           100 &                     1506 &   629396 \\
                  20          &                       2319 &                         228 &                    12 &                             65 &                         34 &                           104 &                     1103 &   417159 \\
                  21          &                       4370 &                         398 &                    53 &                             99 &                         68 &                           133 &                     2066 &   893477 \\
                  22          &                       3133 &                         288 &                    40 &                             29 &                         51 &                           142 &                     1564 &   525595 \\
                  23          &                       4462 &                         475 &                    70 &                             28 &                         97 &                           193 &                     2642 &   879093 \\
                  24          &                       3260 &                         394 &                    46 &                             15 &                         90 &                           126 &                     1776 &   658434 \\
                  25          &                       2784 &                         278 &                    32 &                             12 &                         42 &                           103 &                     1758 &   578304 \\ \bottomrule
            \end{tabular}
      \end{center}
\end{table*}

\begin{table*}[!hbt]
      \begin{center}
            \caption{Metrics details Part II}
            \label{tab:metrics_details_2}
            \begin{tabular}{l| c c c c c c c c c c c }
            \toprule
            \textbf{Release}  & \textbf{t\_dev} & \textbf{dev\_join} & \textbf{dev\_left} & \textbf{complexity} & \textbf{loc} & \textbf{replies}  & \textbf{t\_bugfix}  & \textbf{pre\_release} & \textbf{file\_changes} & \textbf{number\_bugs} &  \textbf{defect\_debt} \\ \midrule  
                  10 &   334 &       79 &        0 &     103354 & 1054944 &            40250 &     1833 &                                631 &        28387 &        1034 &         606   \\                                                                     
                  11 &   335 &        1 &        0 &      99518 & 1032098 &            29965 &     1587 &                                552 &        20867 &         838 &         427   \\                                                                     
                  12 &   389 &       54 &        0 &      96312 &  992345 &            59356 &     2263 &                                933 &        28655 &        1257 &         763   \\                                                                     
                  13 &   396 &        7 &        0 &     100889 & 1035636 &            49727 &     2082 &                                614 &        25809 &        1097 &         561   \\                                                                     
                  14 &   381 &        0 &       15 &     105046 & 1088876 &           235710 &     1840 &                                747 &        23573 &         982 &         561   \\                                                                     
                  15 &   391 &       10 &        0 &     108763 & 1126395 &            90957 &     2814 &                                944 &        34584 &        1593 &         849   \\                                                                     
                  16 &   409 &       18 &        0 &     113591 & 1173469 &           151303 &     2670 &                               1150 &        31070 &        1423 &         789   \\                                                                     
                  17 &   432 &       23 &        0 &     116678 & 1207336 &            74159 &     3775 &                               1072 &        38762 &        2025 &         876   \\                                                                     
                  18 &   426 &        0 &        6 &     122772 & 1263954 &            97929 &     3098 &                               1015 &        32331 &        1755 &         687   \\                                                                     
                  19 &   449 &       23 &        0 &     123926 & 1287722 &            70860 &     3141 &                               1029 &        31225 &        1556 &         946   \\                                                                     
                  20 &   446 &        0 &        3 &     125966 & 1306306 &            46031 &     2174 &                                949 &        22678 &         924 &         738   \\                                                                     
                  21 &   520 &       74 &        0 &     131339 & 1374337 &            84831 &     4337 &                               1050 &        41583 &        2377 &         498   \\                                                                     
                  22 &   487 &        0 &       33 &     136731 & 1432004 &            71139 &     2927 &                                998 &        31082 &        1501 &         882   \\                                                                     
                  23 &   537 &       50 &        0 &     141480 & 1484199 &            91687 &     4614 &                                568 &        46917 &        2421 &         438   \\                                                                     
                  24 &   517 &        0 &       20 &     145514 & 1526971 &            43550 &     3541 &                                829 &        34195 &        1697 &         642   \\                                                                     
                  25 &   510 &        0 &        7 &     149835 & 1583849 &            33591 &     3019 &                                810 &        29114 &        1395 &         390   \\ \bottomrule                                                                    
            \end{tabular}
      \end{center}
\end{table*}
