import * as React from "react";
import PropTypes from "prop-types";

import { Navigate, useNavigate } from "react-router-dom";
import useLocalStorage from "./hooks/useLocalStorage";
import { login as doLogin } from "./service/auth";
import { useLoaderData } from "react-router-dom";

export const AuthContext = React.createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useLocalStorage("user", null);
  const navigate = useNavigate();

  // call this function when you want to authenticate the user
  const login = (username, password) => {
    doLogin(username, password).then(() => {
      setUser({ login: username });
      navigate("/");
    });
  };

  // call this function to sign out logged in user
  const logout = React.useCallback(() => {
    setUser({});
    navigate("/login", { replace: true });
  }, [navigate, setUser]);

  const value = {
    user,
    login,
    logout,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};

AuthProvider.propTypes = {
  children: PropTypes.element.isRequired,
};

export const ProtectedRoute = ({ children }) => {
  const currentUser = useLoaderData();
  const { user } = React.useContext(AuthContext);

  if (user == null) {
    return <Navigate to="/login" />;
  }

  if (currentUser?.username !== user?.login) {
    return <Navigate to="/login" />;
  }

  return children;
};

ProtectedRoute.propTypes = {
  children: PropTypes.element.isRequired,
};
