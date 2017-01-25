class BountiesList extends React.Component {
  render () {
    var start = this.props.start;
    var limit = Infinity || this.props.limit;
    var bounties = this.props.bounties.map(function(bounty){
      if (bounty.id > start && bounty.id < limit) {
        return <Bounty bounty={bounty.component_hash}/>
      } else {
        return null
      }});
    return (
      <div>
        {bounties}
      </div>
    );
  }
}
