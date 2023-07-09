import * as React from "react";

import Box from "@mui/joy/Box";
import Breadcrumbs from "@mui/joy/Breadcrumbs";
import Link from "@mui/joy/Link";
import Sheet from "@mui/joy/Sheet";
import { Link as RouterLink } from "react-router-dom";
import { ChevronRight } from "react-feather";

export default function SensorAdd() {
  return (
    <Sheet
      sx={{
        bgcolor: "background.body",
        flex: 1,
        maxWidth: 1200,
        width: "100%",
        mx: "auto",
      }}
    >
      <Breadcrumbs separator={<ChevronRight />}>
        <Link
          component={RouterLink}
          underline="hover"
          color="neutral"
          fontSize="inherit"
          to="/"
        >
          Sensors
        </Link>
        <Link
          component={RouterLink}
          underline="hover"
          color="neutral"
          fontSize="inherit"
          to="/sensors/new"
        >
          New
        </Link>
      </Breadcrumbs>
      <Box sx={{ my: 2 }} />
    </Sheet>
  );
}
