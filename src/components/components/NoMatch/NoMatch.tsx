import React, { FC } from 'react';
import { Icon, Header } from 'semantic-ui-react';

const NoMatch: FC = () => {
  return (
    <>
      <Icon name="minus circle" size="big" />
      <strong>Page not found!</strong>
    </>
  );
};

export default NoMatch;