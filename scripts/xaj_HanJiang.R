

# save(df, file = "安康.rda")
# load("data-raw/安康.rda")
# load_all("N:/Research/hydro/r_hydro_pkgs/hydroTools")

## version 1, daily scale
r_day <- df %$% calib_xaj(Q, prcp, ET0, area, dt = 24)
plot_calib(r_day, "XAJ_daily.pdf")

## version 2, monthly scale
df_monthly <- df %>%
  mutate(date = lubridate::make_date(year(date), month(date), 1)) %>%
  group_by(date) %>%
  summarise(across(everything(), mean, na.rm = TRUE))

r_mon <- df_monthly %$% calib_xaj(Q, prcp, ET0, area, dt = 24, maxn = 1e4)
plot_calib(r_mon, "XAJ_monthly.pdf")

r_month2 <- calib_xaj(df_monthly$Q, df$prcp, df$ET0, area, dt = 24, dates = df$date)

q_mon = r_month2$data[, c("date", "Q", "prcp")] %>%
  mutate(date = make_monthdate(date)) %>%
  group_by(date) %>%
  summarise(across(everything(), mean, na.rm = TRUE)) %>%
  cbind(Qobs= df_monthly$Q)
gof = q_mon %$% GOF(Qobs, Q) %>% as.list()
plot_calib(q_mon, "XAJ_monthly_v2.pdf")
