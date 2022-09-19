import React from 'react'
import About from '../About'
import renderer from 'react-test-renderer';

describe('testing About Page', () => {
    it("renders without crashing", () => {
        renderer.create(
            <About/>
        )
    })
        
})