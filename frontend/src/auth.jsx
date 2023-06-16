import * as React from "react";
import PropTypes from "prop-types";

import { Navigate, useNavigate } from "react-router-dom";
import useLocalStorage from "./hooks/useLocalStorage";

export const AuthContext = React.createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useLocalStorage("user", null);
  const navigate = useNavigate();

  // call this function when you want to authenticate the user
  const login = React.useCallback(() => {
    setUser({ login: "user" });
    navigate("/");
  }, [navigate, setUser]);

  // call this function to sign out logged in user
  const logout = React.useCallback(() => {
    setUser({});
    navigate("/login", { replace: true });
  }, [navigate, setUser]);

  const value = React.useMemo(
    () => ({
      user,
      login,
      logout,
    }),
    [login, logout, user]
  );

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};

AuthProvider.propTypes = {
  children: PropTypes.element.isRequired,
};

export const ProtectedRoute = ({ children }) => {
  const { user } = React.useContext(AuthContext);
  if (typeof user?.login === "undefined") {
    return <Navigate to="/login" />;
  }
  return children;
};

ProtectedRoute.propTypes = {
  children: PropTypes.element.isRequired,
};
