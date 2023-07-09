import Sheet from "@mui/joy/Sheet";
import Stack from "@mui/joy/Stack";
import Breadcrumbs from "@mui/joy/Breadcrumbs";
import Link from "@mui/joy/Link";
import Button from "@mui/joy/Button";
import { Link as RouterLink } from "react-router-dom";
import { ChevronRight } from "react-feather";

import SensorItem from "../SensorItem";
import { useLoaderData } from "react-router-dom";

export default function SensorList() {
  const sensors = useLoaderData();

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
      </Breadcrumbs>

      <Stack spacing={2} alignItems="center">
        {sensors.map((sensor) => (
          <SensorItem
            key={sensor.address}
            name={sensor.name || "untitled"}
            address={sensor.address}
            isActive
          />
        ))}
        <Button
          variant="outlined"
          fullWidth
          component={RouterLink}
          to="/sensors/new"
        >
          Add More Sensors
        </Button>
      </Stack>
    </Sheet>
  );
}
