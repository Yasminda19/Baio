import * as React from "react";
import Box from "@mui/material/Box";
import Avatar from "@mui/material/Avatar";
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import Paper from "@mui/material/Paper";
import LockOutlinedIcon from "@mui/icons-material/LockOutlined";
import Typography from "@mui/material/Typography";
import { useNavigate, useLocation } from "react-router-dom";

import { useAuth } from "./Auth";

function Login() {
  let navigate = useNavigate();
  let location = useLocation();
  let auth = useAuth();

  let from = location.state?.from?.pathname || "/";

  const [email, setEmail] = React.useState("");
  const [password, setPassword] = React.useState("");

  return (
    <Box
      display="flex"
      justifyContent="center"
      alignItems="center"
      minHeight="80vh"
    >
      <Paper
        elevation={2}
        sx={{
          padding: {
            xs: 2,
            sm: 6,
            md: 10,
          },
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
        }}
      >
        <Avatar sx={{ m: 1, bgcolor: "secondary.main" }}>
          <LockOutlinedIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Sign in
        </Typography>
        <Box component="form" onSubmit={(e) => {
          e.preventDefault();
          console.log(email);
          auth.signin(email, () => {
            navigate(from, { replace: true });
          });
        }} noValidate sx={{ mt: 1 }}>
          <TextField
            margin="normal"
            required
            fullWidth
            id="email"
            label="EMAIL"
            name="email"
            autoComplete="email"
            autoFocus
            value={email}
            onChange={(e) => {
              setEmail(e.target.value);
            }}
          />
          <TextField
            margin="normal"
            required
            fullWidth
            name="password"
            label="PASSWORD"
            type="password"
            id="password"
            autoComplete="current-password"
            value={password}
            onChange={(e) => {
              setPassword(e.target.value);
            }}
          />
          <Box sx={{ height: 10 }} />
          <Button
            type="submit"
            variant="contained"
            sx={{ margin: "0 auto", display: "flex" }}
          >
            Sign In
          </Button>
        </Box>
      </Paper>
    </Box>
  );
}

export default Login;
