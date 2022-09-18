import React, { FC } from 'react';
import { Header } from 'semantic-ui-react';

const DynamicPage: FC = () => {
  return (
    <>
      <Header as="h2">Dynamic Page</Header>
      <p>This page was loaded asynchronously!!!</p>
    </>
  );
};

export default DynamicPage;