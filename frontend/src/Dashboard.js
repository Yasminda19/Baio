import * as React from "react";
import Paper from "@mui/material/Paper";
import Box from "@mui/material/Box";
import { DataGrid } from "@mui/x-data-grid";

function Dashboard() {
  const columns = [
    {
      field: "datetime",
      headerName: "Date,Time",
    },
    {
      field: "uid",
      headerName: "UID",
    },
    {
      field: "channel",
      headerName: "Channel",
    },
    {
      field: "status",
      headerName: "Status",
    },
    {
      field: "rmtp",
      headerName: "RMTP",
    },
    {
      field: "hr_real",
      headerName: "HR Real",
    },
    {
      field: "rr_dl",
      headerName: "RR DL",
    },
    {
      field: "rr_real",
      headerName: "RR Real",
    },
    {
      field: "temp_dl",
      headerName: "Temp DL",
    },
    {
      field: "temp_real",
      headerName: "Temp Real",
    },
    {
      field: "position",
      headerName: "Position",
    },
    {
      field: "awake_status",
      headerName: "Awake Status",
    },
    {
      field: "health",
      headerName: "Overall Health",
    },
  ];

  const data = [
    {
      id: 0,
      datetime: "a",
      uid: "a",
      channel: "a",
      status: "a",
      rmtp: "aa",
      hr_real: "aa",
      rr_dl: "aa",
      rr_real: "aa",
      temp_dl: "aa",
      temp_real: "aa",
      position: "aa",
      awake_status: "aa",
      health: "aa",
    },
  ];

  return (
    <Paper
      elevated={2}
      sx={{
        m: {
          sm: 5,
          md: 8,
        },
        minWidth: "100wh",
        minHeight: "80vh",
        display: "flex",
      }}
    >
      <Box sx={{ flexGrow: 1, width: "100%" }}>
        <DataGrid
          checkboxSelection
          disableSelectionOnClick
          columns={columns}
          rows={data}
        />
      </Box>
    </Paper>
  );
}

export default Dashboard;
