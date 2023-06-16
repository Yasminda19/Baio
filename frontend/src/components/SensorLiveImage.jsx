import React from "react";
import PropTypes from "prop-types";

import Chip from "@mui/joy/Chip";
import Card from "@mui/joy/Card";
import CardContent from "@mui/joy/CardContent";
import CardCover from "@mui/joy/CardCover";
import { Circle, AlertCircle } from "react-feather";
import { useEffect } from "react";

import { getImage } from "../service/sensor";

const convertBlobToBase64 = (blob) =>
  new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onerror = reject;
    reader.onload = () => {
      resolve(reader.result);
    };
    reader.readAsDataURL(blob);
  });

export default function SensorLiveImage({ address }) {
  const [lastModified, setLastModified] = React.useState(false);
  const [uri, setUri] = React.useState(null);

  useEffect(() => {
    getImage(address)
      .then((data) => {
        convertBlobToBase64(data.blob).then(setUri);
        setLastModified(data.lastModified);
      })
      .catch(console.log);
  }, [address]);

  if (!address.match(/^0x[a-fA-F0-9x]+$/)) {
    return <React.Fragment></React.Fragment>;
  }

  const minutesDiff = Math.floor((Date.now() - lastModified) / 60_000);
  const isLive = minutesDiff < 5;

  return (
    <Card sx={{ marginTop: 2, height: "500px" }}>
      <CardCover>
        <img src={uri} alt={address} />
      </CardCover>
      <CardContent>
        <Chip
          color={isLive ? "success" : "danger"}
          style={isLive ? { maxWidth: "70px" } : { maxWidth: "310px" }}
          startDecorator={
            isLive ? (
              <Circle fill="#fff" size={14} />
            ) : (
              <AlertCircle size={16} />
            )
          }
        >
          {/* Last Active at Thursday, May 25 2023 13:45 */}
          {isLive
            ? "Live"
            : `Last Active at ${new Date(lastModified).toISOString()}`}
        </Chip>
      </CardContent>
    </Card>
  );
}

SensorLiveImage.propTypes = {
  address: PropTypes.string.isRequired,
};
