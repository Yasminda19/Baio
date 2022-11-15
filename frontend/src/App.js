import * as React from "react";
import Layout from "./Layout";
import Login from "./Login";
import Dashboard from "./Dashboard";
import { Routes, Route } from "react-router-dom";
import { AuthProvider, RequireAuth } from "./Auth";

function App() {
  // const [auth, setAuth] = React.useState(false);

  return (
    <AuthProvider>
      <Routes>
        <Route element={<Layout />}>
          <Route
            path="/"
            element={
              // <RequireAuth>
              <Dashboard />
              // </RequireAuth>
            }
          />
          <Route path="/login" element={<Login />} />
        </Route>
      </Routes>
    </AuthProvider>
  );
}

export default App;
