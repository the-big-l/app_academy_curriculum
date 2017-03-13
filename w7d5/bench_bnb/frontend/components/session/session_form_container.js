import { connect } from 'react-redux';
import SessionForm from './session_form';
import { login, logout, signup } from '../../actions/session_actions';

const mapStateToProps = ({ session }) => ({
  loggedIn: !!session.currentUser,
  errors: session.errors
});

const mapDispatchToProps = (dispatch, { location }) => {
  const action = location.pathname === '/login' ? login : signup;

  return { processForm: user => dispatch(action(user)) };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
