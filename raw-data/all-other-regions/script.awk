BEGIN {
  FS=":"
  oblast = "";
  region = "";
  title = "";
  author = "";
  address = "";
  phone = "";
  description = "";
  email = "";
  site = "";
  last_term = "";
  flag_next_is_title = 0;
}

                     { if (flag_next_is_title) {
                         title = $0;
                         flag_next_is_title = 0
                         }
                     }
 /^=====/            { flag_next_is_title = 1;
                       print("|", oblast, "|", region, "|", title, "|", author, "|", address, "|", phone, "|", email, "|", site, "|", description, "|");
                       title = "";
                       author = "";
                       address = "";
                       phone = "";
                       description = "";
                       email = "";
                       site = "";
                     }
 /^-----/            { flag_next_is_title = 1;
                       region = last_term;
                     }
 /^\+\+\+\+\+/       { oblast = last_term;
                     }
 /^Глава хозяйства:/ { author = $2;        }
 /^Адрес:/           { address = $2;       }
 /^Тел.:/            { phone = $2;         }
 /^Деятельность:/    { description = $2;   }
 /^E-mail:/          { email = $2;         }
 /^Сайт:/            { site = $2;          }
                     {
                       last_term = $0;
                     }

END {
}
