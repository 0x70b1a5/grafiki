class Bounty extends React.Component {
  render () {
    // var fillBtn = <Button
    //   text={"Fill this bounty"}
    //   url={"/bounties/fill/?id="+this.props.id}
    //   theme={"light"} />

    // if we got the bounty as a parameter, use it exclusively

    return (
      <div className="bounty-component">
        <div className="bc-img"><img src={this.props.pic} /></div>
        <div className="bc-info">
          <h2>{this.props.title}</h2>
          <div><pre>Location: {
              [this.props.lat, this.props.lng].map(
                (coord) => {return String(coord).slice(0,8)}
              ).join(", ")
             }</pre></div>
           <div>{this.props.description || "No description given."}</div>
          <div>Artist: {this.props.artist}</div>
          <div>Commissioned by: {this.props.patron || "unknown"}</div>
          <Button
            text={"Donate to this artist"}
            url={"/escrows/new/?bounty_id="+this.props.id}
            theme={"dark"} />
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
