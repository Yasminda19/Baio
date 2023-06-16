import React from "react";
import ReactDOM from "react-dom/client";

import CssBaseline from "@mui/joy/CssBaseline";
import { CssVarsProvider } from "@mui/joy/styles";
import { RouterProvider, createBrowserRouter, Outlet } from "react-router-dom";

import Layout from "./components/Layout";

import { sensorLoader } from "./components/pages/loader";
import Login from "./components/pages/Login";
import SensorList from "./components/pages/SensorList";
import Sensor from "./components/pages/Sensor";

import { AuthProvider, ProtectedRoute } from "./auth";
import customTheme from "./theme";

const router = createBrowserRouter([
  {
    path: "/",
    element: (
      <AuthProvider>
        <Outlet />
      </AuthProvider>
    ),
    children: [
      {
        path: "",
        element: (
          <ProtectedRoute>
            <Layout />
          </ProtectedRoute>
        ),
        children: [
          {
            path: "sensors",
            element: <SensorList />,
          },
          {
            path: "sensors/:address",
            element: <Sensor />,
            loader: sensorLoader,
          },
        ],
      },
      {
        path: "login",
        element: <Login />,
      },
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.Fragment>
    <CssVarsProvider disableTransitionOnChange theme={customTheme}>
      <CssBaseline />
      <RouterProvider router={router} />
    </CssVarsProvider>
  </React.Fragment>
);
