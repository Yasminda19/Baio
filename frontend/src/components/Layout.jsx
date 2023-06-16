import * as React from "react";

import Box from "@mui/joy/Box";
import { Outlet } from "react-router-dom";

import Header from "./Header";
import Sidebar from "./Sidebar";

function App() {
  return (
    <React.Fragment>
      <Box sx={{ display: "flex", minHeight: "100dvh" }}>
        <Header />
        <Sidebar title="Baio" />
        <Box
          component="main"
          className="MainContent"
          sx={(theme) => ({
            "--main-paddingTop": {
              xs: `calc(${theme.spacing(2)} + var(--Header-height, 0px))`,
              md: "32px",
            },
            px: {
              xs: 2,
              md: 3,
            },
            pt: "var(--main-paddingTop)",
            pb: {
              xs: 2,
              sm: 2,
              md: 3,
            },
            flex: 1,
            display: "flex",
            flexDirection: "column",
            minWidth: 0,
            height: "100dvh",
            gap: 1,
            overflow: "auto",
          })}
        >
          <Outlet />
        </Box>
      </Box>
    </React.Fragment>
  );
}

export default App;
