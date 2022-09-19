import React from 'react'
import DynamicPage from '../DynamicPage'
import renderer from 'react-test-renderer';

describe('testing DynamicPage Page', () => {
    it("renders without crashing", () => {
        renderer.create(
            <DynamicPage/>
        )
    })
})