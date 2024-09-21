local ObjectSettings = {}

ObjectSettings.Settings = {
	Part = {
		properties = {
			Size = Vector3.new(4, 1, 2),
			Position = Vector3.new(0, 0, 0),
			Anchored = true,
			Color = Color3.new(1, 0, 0),
			Transparency = 0
		},
		functions = {
			SetPosition = function(part, position)
				part.Position = position
			end,
			ChangeColor = function(part, color)
				part.Color = color
			end
		}
	},
	Model = {
		properties = {
			PrimaryPart = nil,
			Name = "NewModel",
			PrimaryPartCFrame = CFrame.new(0, 0, 0)
		},
		functions = {
			SetPrimaryPart = function(model, part)
				model.PrimaryPart = part
			end,
			Rename = function(model, newName)
				model.Name = newName
			end
		}
	},
	Tool = {
		properties = {
			Grip = CFrame.new(0, 0, 0),
			CanBeDropped = true,
			Name = "NewTool"
		},
		functions = {
			SetGrip = function(tool, grip)
				tool.Grip = grip
			end,
			ToggleDrop = function(tool)
				tool.CanBeDropped = not tool.CanBeDropped
			end
		}
	},
	RemoteEvent = {
		properties = {
			Name = "NewRemoteEvent"
		},
		functions = {
			FireAllClients = function(event, ...)
				event:FireAllClients(...)
			end,
			FireClient = function(event, player, ...)
				event:FireClient(player, ...)
			end
		}
	},
	RemoteFunction = {
		properties = {
			Name = "NewRemoteFunction"
		},
		functions = {
			InvokeClient = function(func, player, ...)
				return func:InvokeClient(player, ...)
			end,
			InvokeServer = function(func, ...)
				return func:InvokeServer(...)
			end
		}
	},
	BindableEvent = {
		properties = {
			Name = "NewBindableEvent"
		},
		functions = {
			Fire = function(event, ...)
				event:Fire(...)
			end
		}
	},
	BindableFunction = {
		properties = {
			Name = "NewBindableFunction"
		},
		functions = {
			Invoke = function(func, ...)
				return func:Invoke(...)
			end
		}
	},
	Sound = {
		properties = {
			Volume = 1,
			Pitch = 1,
			Looped = false,
			Name = "NewSound"
		},
		functions = {
			Play = function(sound)
				sound:Play()
			end,
			Stop = function(sound)
				sound:Stop()
			end
		}
	},
	Folder = {
		properties = {
			Name = "NewFolder"
		},
		functions = {
			AddItem = function(folder, item)
				item.Parent = folder
			end
		}
	},
	ScreenGui = {
		properties = {
			Name = "NewScreenGui"
		},
		functions = {
			SetVisible = function(gui, visible)
				gui.Enabled = visible
			end
		}
	},
	Frame = {
		properties = {
			Size = UDim2.new(0, 200, 0, 100),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			Name = "NewFrame"
		},
		functions = {
			SetSize = function(frame, size)
				frame.Size = size
			end,
			SetBackgroundColor = function(frame, color)
				frame.BackgroundColor3 = color
			end
		}
	},
	TextLabel = {
		properties = {
			Size = UDim2.new(0, 200, 0, 50),
			Position = UDim2.new(0, 0, 0, 0),
			Text = "New Label",
			TextColor3 = Color3.new(0, 0, 0)
		},
		functions = {
			SetText = function(label, text)
				label.Text = text
			end,
			SetTextColor = function(label, color)
				label.TextColor3 = color
			end
		}
	},
	TextButton = {
		properties = {
			Size = UDim2.new(0, 200, 0, 50),
			Position = UDim2.new(0, 0, 0, 0),
			Text = "Button",
			BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
		},
		functions = {
			SetText = function(button, text)
				button.Text = text
			end,
			SetBackgroundColor = function(button, color)
				button.BackgroundColor3 = color
			end
		}
	},
	ImageLabel = {
		properties = {
			Size = UDim2.new(0, 100, 0, 100),
			Position = UDim2.new(0, 0, 0, 0),
			Image = "rbxassetid://0"
		},
		functions = {
			SetImage = function(imageLabel, imageId)
				imageLabel.Image = imageId
			end
		}
	},
	ImageButton = {
		properties = {
			Size = UDim2.new(0, 100, 0, 100),
			Position = UDim2.new(0, 0, 0, 0),
			Image = "rbxassetid://0"
		},
		functions = {
			SetImage = function(imageButton, imageId)
				imageButton.Image = imageId
			end
		}
	},
	ParticleEmitter = {
		properties = {
			Rate = 10,
			Lifetime = NumberRange.new(1, 2),
			Size = NumberSequence.new(1)
		},
		functions = {
			Start = function(emitter)
				emitter.Enabled = true
			end,
			Stop = function(emitter)
				emitter.Enabled = false
			end
		}
	},
	BodyVelocity = {
		properties = {
			Velocity = Vector3.new(0, 0, 0),
			MaxForce = Vector3.new(4000, 4000, 4000)
		},
		functions = {
			SetVelocity = function(bodyVelocity, velocity)
				bodyVelocity.Velocity = velocity
			end
		}
	}
}

function ObjectSettings:GetSettings(objectName)
	return self.Settings[objectName]
end

return ObjectSettings
