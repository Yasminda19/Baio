import PropTypes from "prop-types";

import Chip from "@mui/joy/Chip";
import Card from "@mui/joy/Card";
import CardContent from "@mui/joy/CardContent";
import CardOverflow from "@mui/joy/CardOverflow";
import Divider from "@mui/joy/Divider";
import Typography from "@mui/joy/Typography";
import { Link as RouterLink } from "react-router-dom";

export default function SensorItem({ name, address, isActive }) {
  return (
    <Card
      component={RouterLink}
      to={`/sensors/${address}`}
      variant="outlined"
      orientation="horizontal"
      sx={{
        bgcolor: "background.body2",
        textDecoration: "none",
        width: "100%",
        "&:hover": {
          boxShadow: "md",
          borderColor: "neutral.outlinedHoverBorder",
        },
      }}
    >
      <CardContent sx={{ px: 2 }}>
        <Typography
          fontWeight="md"
          textColor={isActive ? "success.plainColor" : "danger.plainColor"}
          mb={0.5}
        >
          {name}
        </Typography>
        <Chip
          variant="outlined"
          color="primary"
          size="sm"
          sx={{
            pointerEvents: "none",
            maxWidth: "fit-content",
            textOverflow: "ellipsis",
            "@media (min-width: 0px) and (max-width: 400px)": {
              maxWidth: "210px",
            },
          }}
        >
          {address}
        </Chip>
      </CardContent>
      <Divider />
      <CardOverflow
        variant="soft"
        color={isActive ? "success" : "danger"}
        sx={{
          px: 0.2,
          writingMode: "vertical-rl",
          textAlign: "center",
          fontSize: "xs2",
          fontWeight: "xl2",
          letterSpacing: "1px",
          textTransform: "uppercase",
        }}
      >
        {isActive ? "Active" : "Inactive"}
      </CardOverflow>
    </Card>
  );
}

SensorItem.propTypes = {
  name: PropTypes.string,
  address: PropTypes.string.isRequired,
  isActive: PropTypes.bool,
};
