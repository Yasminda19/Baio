import Sheet from "@mui/joy/Sheet";
import Stack from "@mui/joy/Stack";
import Breadcrumbs from "@mui/joy/Breadcrumbs";
import Link from "@mui/joy/Link";
import Button from "@mui/joy/Button";
import { Link as RouterLink } from "react-router-dom";
import { ChevronRight } from "react-feather";

import SensorItem from "../SensorItem";

export default function SensorList() {
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
          to="/sensors"
        >
          Sensors
        </Link>
      </Breadcrumbs>

      <Stack spacing={2} alignItems="center">
        <SensorItem
          name="Jonah"
          address="0x331E1882e0FC0fa68fF8b42cB684b77638D6941C"
          isActive
        />
        <SensorItem
          name="Debby"
          address="0x331E1882e0FC0fa68fF8b42cB684b77638D6941C"
        />
        <Button variant="outlined" fullWidth>
          Add More Sensors
        </Button>
      </Stack>
    </Sheet>
  );
}
