import React, { FC, useState } from 'react';

const Home: FC = () => {
  const [arr,setArr] = useState<number[]>([]);
  return (
    <>
      <p>Hello World of React and Webpack!</p>
      <button type="button" onClick={()=>
          setArr(prev=>
          [...prev, 
          Math.floor(Math.random() * 100) + 1])}>Click Me!!!</button>
      <p data-testid="numlist">{arr.join(',')}</p>
    </>
  );
};

export default Home;