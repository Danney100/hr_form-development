import { configure } from 'enzyme';

// NOTE: enzyme-adapter-react-16 is not compatible with React 17
// so we are using this hotfix enzyme adapter version until
// there is an official release
import Adapter from '@wojtekmaj/enzyme-adapter-react-17';
import 'jsdom-global/register';

configure({ adapter: new Adapter() });
