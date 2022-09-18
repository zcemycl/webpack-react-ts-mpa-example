import React, { FC, Suspense, lazy } from 'react';
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { Layout } from './components'

const Home: FC = lazy(() => import('./components/Home/Home'));
const DynamicPage: FC = lazy(() => import('./components/DynamicPage/DynamicPage'));
const NoMatch: FC = lazy(() => import('./components/NoMatch/NoMatch'));
const About: FC = lazy(() => import('./components/About/About'));

type Props = {
    basename: string;
}

const App = ( props: Props = { basename: '/' } ) => {
    return (
        <Router basename={props.basename}>
            <Layout>
                <Suspense fallback={<div>Loading ...</div>}>
                <Routes>
                    <Route path="/" element={<Home/>}/>
                    <Route path="/about" element={<About/>}/>
                    <Route path="/dynamic" element={<DynamicPage/>}/>
                    <Route path="*" element={<NoMatch/>}/>
                </Routes>
                </Suspense>
            </Layout>
        </Router>
    )
}

export default App;