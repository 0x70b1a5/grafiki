class BountyImage extends React.Component {
  render () {
    console.log(this.props.img)
    return (
      <div>
        <img src={this.props.img}
          style={{
            height: this.props.height || "inherit",
            width: this.props.width || "inherit",
            maxHeight: this.props.maxh,
            maxWidth: this.props.maxw
          }}/>
      </div>
    );
  }
}

BountyImage.propTypes = {
  pic: React.PropTypes.string
};
