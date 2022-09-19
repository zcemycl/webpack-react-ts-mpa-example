import React from 'react';
import { render, waitFor } from '@testing-library/react';
import App from '../App';
import userEvent from '@testing-library/user-event'
import '@testing-library/jest-dom'

describe('testing App', () => {

    test('on home page', async () => {
        const { getByText } = render(<App basename='/'/>)
        const user = userEvent.setup()
        
        await waitFor(() => {
            expect(getByText(/Hello World of React and Webpack!/i)).toBeInTheDocument()
        })
    })

    it("click to about page", async () => {
        const { getByText } = render(<App basename='/'/>)
        const user = userEvent.setup()
        
        await waitFor(() => {
            user.click(getByText(/Navigate to About Page/i))
            expect(getByText(/This is the About Page.../i)).toBeInTheDocument()
        })
    })

    test('click to dynamic page', async () => {
        const { getByText } = render(<App basename='/'/>)
        const user = userEvent.setup()
        
        await waitFor(() => {
            user.click(getByText(/Navigate to Dynamic Page/i))
            expect(getByText(/Dynamic Page/i)).toBeInTheDocument()
        })
    })

    
})