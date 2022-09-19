import React from 'react'
import NoMatch from '../NoMatch'
import renderer from 'react-test-renderer';

describe('testing NoMatch Page', () => {
    it("renders without crashing", () => {
        renderer.create(
            <NoMatch/>
        )
    })
})