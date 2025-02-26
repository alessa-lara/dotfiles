create-react-app $1
cd $1
cd src
rm setupTests.js reportWebVitals.js App.test.js logo.svg

echo "import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);" > index.js

echo "import './App.css';

function App() {
    return (
        <div>

        </div>
    );
}

export default App;
" > App.js

mv App.js App.jsx
