class Bounty extends React.Component {
  render () {
    // if we got the bounty as a parameter, use it
    var bounty = this.props.bounty || this.props
    var payText = bounty.pic == "" ?
      "Raise this bounty"
      : "Donate to this artist"

    return (
      <div className="bounty-component" key={bounty.id}>
        <BountyImage img={bounty.pic} maxw={"500px"} maxh={"300px"}/>
        <div className="bc-info">
          <h2>{bounty.title}</h2>
          <div><pre>Location: {
              [bounty.lat, bounty.lng].map(
                (coord) => {return String(coord).slice(0,8)}
              ).join(", ")
             }</pre></div>
           <div>{bounty.description || "No description given."}</div>
          <div>Artist: {bounty.artist}</div>
          <div>Commissioned by: {bounty.patron || "unknown"}</div>
          <p></p>
          <div>
            <Button
              text={payText}
              url={"/escrows/new/?bounty_id="+bounty.id}
              theme={"dark"} />
            <Button
              text={"View on map"}
              url={"/pages/map/?id="+bounty.id}
              theme={"dark"} />
          </div>
        </div>
      </div>
    );
  }
}

Bounty.propTypes = {
  title: React.PropTypes.string,
  lat: React.PropTypes.node,
  lng: React.PropTypes.node,
  amount: React.PropTypes.node,
  description: React.PropTypes.string,
  patron: React.PropTypes.string,
  artist: React.PropTypes.string,
  pic: React.PropTypes.string
};
