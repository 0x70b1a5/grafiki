class BountyImage extends React.Component {
  render () {
    return (
      <div>
        <a href={this.props.img}>
          <img src={this.props.img}
            style={{
              height: this.props.height || "inherit",
              width: this.props.width || "inherit",
              maxHeight: this.props.maxh,
              maxWidth: this.props.maxw
            }}/>
        </a>
      </div>
    );
  }
}

BountyImage.propTypes = {
  pic: React.PropTypes.string
};
