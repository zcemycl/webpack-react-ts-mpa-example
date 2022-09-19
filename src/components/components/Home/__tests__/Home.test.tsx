import React from 'react'
import Home from '../Home'
import { render, fireEvent, screen } from '@testing-library/react';

describe('testing Home Page', () => {
    it("click twice", async () => {
        const { getByRole } = render(
            <Home/>
        )

        const button = getByRole("button", 
            { name: 'Click Me!!!' });
        expect(button.innerHTML).toBe('Click Me!!!');
        fireEvent.click(button)
        fireEvent.click(button)
        
        const paragraph = screen.getByTestId('numlist');
        expect(paragraph.innerHTML).not.toBe('');
        
    })
})