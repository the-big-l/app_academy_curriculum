import { connect } from 'react-redux';
import SessionForm from './session_form';
import { login, logout, signup } from '../../actions/session_actions';

const mapStateToProps = ({ session }) => ({
  loggedIn: !!session.currentUser,
  errors: session.errors
});

const mapDispatchToProps = (dispatch, { location }) => {
  const formType = location.pathname.slice(1);
  const action = formType === 'login' ? login : signup;

  return {
    processForm: user => dispatch(action(user)),
    formType
   };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
