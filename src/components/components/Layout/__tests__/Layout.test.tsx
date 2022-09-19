import React from 'react'
import Layout from '../Layout'
import { BrowserRouter as Router } from 'react-router-dom';
import { render, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom'


describe('testing Layout Page', () => {
    it("renders without crashing", async () => {
        const { getByText } = render(<Layout children={<p>Hi</p>}/>, {wrapper: Router})
        await waitFor(() => {
            expect(getByText(/Hi/i)).toBeInTheDocument()
        })
    })
})